from multiprocessing import Process, Manager
import subprocess
import shlex
import sys

stations = [72,79,82,83,116,119,120,127,128,137,143,144,146,147,150,151,152,153,157,160,161,164,167,168,173,174,195,212,216,217,218,223,224,225,228,229,232,233,236,237,238,239,241,242,243,244,245,247,248,249,250,251,252,253,254,257,258,259,260,261,262,263,264,265,266,267,268,270,274,275,276,278,279,280,281,282,284,285,289,290,291,293,294,295,296,297,298,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,334,335,336,337,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,372,373,375,376,377,379,380,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,405,406,407,408,409,410,411,412,414,415,416,417,418,419,420,421,422,423,426,427,428,430,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,453,454,455,456,457,458,459,460,461,462,463,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,536,537,538,539,540,545,546,2000,2001,2002,2003,2004,2005,2006,2008,2009,2010,2012,2017,2021,2022,2023,3002,3016,3017,3041,3042,3043,3044,3046,3047,3048,3049,3050,3051,3052,3053,3054,3055,3056,3057,3058,3059,3060,3061,3062,3063,3064,3065,3066,3067,3068,3069,3070,3071,3072,3073,3074,3075,3076,3077,3078,3079,3080,3081,3082,3083,3084,3085,3086,3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100,3101,3102,3103,3104,3105,3106,3107,3108,3109,3110,3111,3112,3113,3114,3115,3116,3117,3118,3119,3120,3121,3122,3123,3124,3125,3126,3127,3128,3129,3130,3131,3132,3134,3135,3136,3137,3138,3139,3140,3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,3151,3152,3153,3154,3155,3156,3157,3158,3159,3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3175,3176,3177,3178,3179,3180,3182,3183,3184,3185,3186,3187,3188,3189,3190,3191,3192,3193,3194,3195,3196,3197,3198,3199,3200,3201,3202,3203,3205,3206,3207,3209,3210,3211,3212,3213,3214,3215,3216,3217,3220,3221,3222,3223,3224,3225,3226,3229,3230,3231,3232,3233,3234,3235,3236,3237,3238,3241,3242,3243,3244,3246,3248,3249,3252,3253,3254,3255,3256,3257,3258,3259,3260,3263,3264,3265,3266,3267,3268,3269,3270,3271,3272,3273,3274,3275,3276,3277,3278,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3293,3294,3295,3297,3298,3299,3300,3301,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3316,3317,3319,3320,3321,3322,3323,3324,3325,3326,3327,3328,3329,3330,3331,3332,3333,3334,3335,3336,3338,3339,3340,3341,3342,3343,3344,3345,3346,3347,3348,3349,3350,3351,3353,3354,3355,3356,3357,3358,3359,3360,3361,3362,3363,3364,3365,3366,3367,3368,3370,3372,3373,3374,3375,3376,3377,3378,3379,3381,3382,3383,3384,3385,3386,3387,3388,3389,3390,3391,3392,3393,3394,3395,3396,3397,3398,3399,3400,3401,3402,3403,3404,3405,3407,3408,3409,3410,3411,3412,3413,3414,3415,3416,3417,3418,3419,3420,3421,3422,3423,3424,3425,3426,3427,3428,3429,3430,3431,33061]

username = "chc631"
og_table = "station_201510_201609_killnull_yesservice_nodup"
base_table_name = "station_diff2_201510_201609_killnull_yesservice_nodup"
cmd1 = "beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station2 -n %s -e \" CREATE TABLE %s AS SELECT dock_id, dock_name, tot_docks, lat, long, lag(created_at,1) OVER (ORDER BY dock_id,created_at) start_time, created_at as end_time, avail_bikes - lag(avail_bikes, 1) OVER (ORDER BY dock_id, created_at) bike_delta, avail_docks - lag(avail_docks, 1) OVER (ORDER BY dock_id, created_at) dock_delta FROM %s where dock_id=%s order by dock_id, start_time\";"


cmd2 = "beeline -u jdbc:hive2://babar.es.its.nyu.edu:10000/CitiBike_Station2 -n %s -e \"insert into %s SELECT dock_id, dock_name, tot_docks, lat, long, lag(created_at,1) OVER (ORDER BY dock_id,created_at) start_time, created_at as end_time, avail_bikes - lag(avail_bikes, 1) OVER (ORDER BY dock_id, created_at) bike_delta, avail_docks - lag(avail_docks, 1) OVER (ORDER BY dock_id, created_at) dock_delta FROM %s where dock_id=%s order by dock_id, start_time\";"


def do_work(in_queue, out_list):
    """
    work for multiprocessing workers
    """
    while True:
        try:
            item = in_queue.get()
            building_tables(item)
        except:
            sys.exit()


def building_tables(stations):
    table_name = base_table_name + '_' + str(stations[0]) + '_' + str(stations[-1])
    cmd = cmd1 % (username, table_name, og_table, stations[0])
    print cmd
    proc_1 = subprocess.Popen(shlex.split(cmd), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output_1, err_1 = proc_1.communicate()
    print output_1, err_1
    for station in stations[1:]:
        cmd = cmd2 % (username, table_name, og_table, station)
        print cmd
        proc_2 = subprocess.Popen(shlex.split(cmd), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        output_2, err_2 = proc_2.communicate()
        print output_2, err_2

if __name__ == "__main__":
    gap = len(stations) / 10
    num_workers = 10 
    manager = Manager()
    results = manager.list()
    work = manager.Queue(num_workers)

    # start for workers
    pool = []
    for i in xrange(num_workers):
        p = Process(target=do_work, args=(work, results))
        p.start()
        pool.append(p)
    # produce data

    previous_index = 0
    for i in xrange(gap, len(stations), gap):
        station_parse = stations[previous_index:i]
        work.put(station_parse)
        previous_index = i

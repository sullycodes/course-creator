
[1mFrom:[0m /mnt/c/Users/dansu/dev/flatiron/projects/course-creator/app/controllers/courses_controller.rb @ line 17 CoursesController#create:

    [1;34m11[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m12[0m:     [1;34m#@course = Course.create(course_params) [0m
    [1;34m13[0m:     @course = [1;34;4mCourse[0m.new(
    [1;34m14[0m:         [35mtitle[0m: params[[33m:course[0m][[33m:title[0m],
    [1;34m15[0m:         [35mteacher_id[0m: params[[33m:course[0m][[33m:teacher[0m]
    [1;34m16[0m:     )
 => [1;34m17[0m:     binding.pry
    [1;34m18[0m: 
    [1;34m19[0m:     @course.save
    [1;34m20[0m:     [32mif[0m @course.save
    [1;34m21[0m:         redirect_to course_path(@course)
    [1;34m22[0m:     [32melse[0m
    [1;34m23[0m:         redirect_to [31m[1;31m'[0m[31m/[1;31m'[0m[31m[0m
    [1;34m24[0m:     [32mend[0m
    [1;34m25[0m: [32mend[0m


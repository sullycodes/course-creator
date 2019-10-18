X create teachers through signup
x login teachers
x validate username presence and uniqueness
create student CRUD
associate teachers with students and have access to CRUD

ASSOCIATIONS

has_many/belongs to = school > teachers
                             > students
                             > courses

has_many through =  teacher has_many students thorugh courses (vice versa)


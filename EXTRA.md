


TEACHER SHOW

<% student_list = [] %>
<% @teacher.students.each do |s| %>
    <%student_list << s.name %>
<% end %>
<p>Students: <%= student_list.map{ |n| n.capitalize }.join(', ') %></p>


<p>Current Courses:
<% @teacher.courses.each do |c| %>
    <ul>
        <li><%= link_to c.title, course_path(c) %></li>
    </ul>
<% end %>
</p>

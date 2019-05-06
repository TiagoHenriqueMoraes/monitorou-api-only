# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@fatec = Institution.create(
  name: "Fatec"
)

["Análise e Desenvolvimento de sistemas", "Têxtil e Moda", "Produção Têxtil", "Segurança da Informação",
  "Jogos Digitais", "Logística", "Gestão Empresarial"].each do |course|
  Course.create(
    name: course,
    institution_id: @fatec.id
  )
end

subject_array = ["Matematica", "Calculo", "Linguas", "Programação", "Ciência", "Química", "Inglês",
                 "Redes", "Fanfic"] 

subject_array.each do |subject|
    Subject.create!(
      name: subject,
    )
  end

@student = User.create(
  name: "estudante",
  email: "estudante@fatec.com",
  course_id: Course.all.sample.id,
  institution_id: @fatec.id,
  kind: 0,
  password: "123456",
  password_confirmation: "123456"
)

@monitor = User.create(
  name: "monitor",
  email: "monitor@fatec.com",
  course_id: Course.all.sample.id,
  institution_id: @fatec.id,
  kind: 1,
  password: "123456",
  password_confirmation: "123456"
)

@admin = User.create(
  name: "admin",
  email: "admin@fatec.com",
  course_id: Course.all.sample.id,
  institution_id: @fatec.id,
  kind: 2,
  password: "123456",
  password_confirmation: "123456"
)

Course.all.each do |course|
  subjects = Subject.all.shuffle
  3.times do
    CoursesSubject.create(course: course, subject: subjects.pop )
  end
end 
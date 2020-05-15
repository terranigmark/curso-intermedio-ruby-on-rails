['juan', 'andrea', 'leon', 'andres', 'natalia', 'camilo', 'rusbel', 'johan'].each do |name|
  User.create email: "#{name}@platzi.com", password: '123456'
end
puts 'Users has been created'

['desarrollo', 'investigación', 'mercadeo', 'diseño', 'conceptualización', 'ejercicios'].each do |name|
  Category.create name: name, description: '--'
end
puts 'Categories has been created'

owner = User.find_by(email: 'johan@platzi.com')
[
  ['conceptualización', 'Bienvenida ', ['johan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', '¿Qué es ruby on rails y por qué usarlo?', ['johan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Entorno de desarrollo de RoR', ['johan:1', 'leon:2', 'andrea:random']],
  ['ejercicios', 'Instalación de Ruby, RoR en windows y Linux', ['johan:1', 'leon:2', 'andrea:random']],
  ['ejercicios', 'Instalación de Ruby, RoR en Mac', ['johan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Entender la web con rieles', ['johan:1', 'leon:2', 'andrea:random']],
  ['ejercicios', 'Crear una nueva aplicación RoR ¡Hola Rails!', ['johan:1', 'leon:2', 'andrea:random']],
  ['ejercicios', 'Manipular el patrón MVC', ['johan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', '¿Qué vamos a desarrollar?', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Crear la base de nuestra aplicación', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Los secretos de rails', ['johan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Assets y Layouts', ['johan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Diseñar el modelo de datos', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Agregar primer conjunto de scaffolds', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Cómo entender las migraciones', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Esteroides para tu desarrollo - HAML/SLIM', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Esteroides para tu desarrollo - Simple Form', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Regenerando el primer conjunto de scaffolds', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Internacionalización de tu aplicación', ['johan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Esteroides para tu desarrollo - Debugging', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Agregar validaciones de modelo', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Añadiendo el concepto de usuario', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Añadir participantes a la tarea', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'CanCanCan ¿puedes hacerlo?', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Callbacks en Rails', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Enviar email a los participantes', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Añadir comentarios vía AJAX', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Cargar un archivo por tarea', ['johan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Embellecer nuestra aplicación', ['johan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Desplegando a Heroku', ['johan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Conclusiones del curso', ['johan:1', 'leon:2', 'andrea:random']],
].each do |category, description, participant_set|
  participants = participant_set.map do |participant|
    user_name, raw_role = participant.split(':')
    role = raw_role == 'random' ? [1, 2].sample : raw_role
    Participant.new(
      user: User.find_by(email: "#{user_name}@platzi.com"),
      role: role
    )
  end
  Task.create!(
    category: Category.find_by(name: category),
    name: "Tarea ##{Task.count + 1}",
    description: description,
    due_date: Date.today + 15.days,
    owner: owner,
    participating_users: participants
  )
end
puts 'Tasks has been created'

Rails.application.routes.draw do
  resources :sections
  resources :students
  resources :section_timing_students
  resources :section_timings
  resources :classrooms
  resources :teachers do
    resources :teacher_subjects, shallow: true
  end
  resources :subjects

  get 'welcome', to: 'home#welcome', as: 'welcome'
  post 'find_student', to: 'home#find_student'

  get 'student_sections', to: 'home#student_sections', as: 'student_sections'
  post 'add_student_section/:id', to: 'home#add_student_section', as: 'add_student_section'
  delete 'remove_student_section/:id', to: 'home#remove_student_section', as: 'remove_student_section'

  get 'student_sections_pdf', to: 'home#student_sections_pdf', as: 'student_sections_pdf'

  root to: 'home#welcome'
end

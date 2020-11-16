class Project < ApplicationRecord
    validates :name, :description, presence: true
    enum state: {Propuesta: 0, En_progreso: 1, Terminado: 2}


     before_save :has_states
     def has_states
        if self.state.nil?
            self.state = "Propuesta"
        end
     end     
end

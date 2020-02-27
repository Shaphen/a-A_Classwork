require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)

        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []

    end

    def valid_title?(title)
        @salaries.each do |k, v|
            return true if k == title
        end
    false
    end

    def > (other_startup)
        self.funding > other_startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise 'not a valid title'
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)

        if @funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        avg = 0
        @employees.each do |employee|
            position = employee.title   #salaries = {CEO: 4000, Engineer: 3000, }
            @salaries.each do |k, v|
                if k == position    # Engineer
                    avg += v # 4000 + 3000
                end
            end
        end
        avg / @employees.length 
    end
    
    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup_2)
        @funding += startup_2.funding
        startup_2.salaries.each do |salary|
            if !@salaries.has_key?(salary[0])
                @salaries[salary[0]] = salary[1]
            end
        end
        startup_2.employees.each {|employee| @employees << employee }
        startup_2.close
    end

end

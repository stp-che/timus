require_relative 'spec_helper'

describe_problem '1022' do

  _example ['5',
            '0',
            '4 5 1 0',
            '1 0',
            '5 3 0',
            '3 0']*"\n", 

           '2 4 5 3 1'


  _example ['3', 
            '0', 
            '3 0', 
            '1 0']*"\n", 

           '2 3 1'

end
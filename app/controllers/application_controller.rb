class ApplicationController < ActionController::Base

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_random_form
    render({ :template => "calculation_templates/rand_form.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)
    render({ :template => "calculation_templates/rand_results.html.erb" })
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root
    @num = params.fetch("wolf").to_f
    @square_root = Math.sqrt(@num)
    render({ :template => "calculation_templates/square_root_results.html.erb" })
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("apr").to_f
    @apr = @apr / 100 / 12
    @apr = @apr.to_s(:percentage, { :precision => 4 } )
    @apr = @apr.to_i
    @years = params.fetch("years").to_f
    @years = @years * 12
    @years = @years.to_i
    @principal = params.fetch("principal").to_f(:currency)
    @numerator = (@apr * @principal).to_i
    @denominator = (1-((1+@apr) ** (-@years))).to_i
    @payment = (@numerator/@denominator).to_f(:currency)
    render({ :template => "calculation_templates/payment_results.html.erb" })
  end

end

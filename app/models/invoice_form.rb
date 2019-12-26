class InvoiceForm
    attr_reader :parameters
    def initialize(parameters)
        @parameters = parameters        
    end

    def billing_date
        Time.new(parameters[:year], parameters[:month], parameters[:day] if time_data_present?)
    rescue ArgumentError
    end

    def company_name
        parameters[:_messed_up_company_name] || parameters[:company_name]
    end

    def valid?
        billing_date.present? && company_name.present?
    end

    private

    def time_data_present?
        [parameters[:year], parameters[:month], parameters[:day]].all?(&:present?)
    end
end

form = InvoiceForm.new({year: "2019", month: "12", day: "26"})
form.billing_date
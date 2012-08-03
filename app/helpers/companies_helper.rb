module CompaniesHelper
  def list_name company
    if company.name.length > 13
      company.name[0,12]<<".."
    else
      company.name
    end
  end
end

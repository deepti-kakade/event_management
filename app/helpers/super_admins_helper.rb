module SuperAdminsHelper
  def count_users_of_company(company)
    @count = company.users.size
  end
end

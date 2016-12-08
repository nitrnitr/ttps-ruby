module ListsHelper
  def list_path(list)
    "/lists/#{list.slug}"
  end
end

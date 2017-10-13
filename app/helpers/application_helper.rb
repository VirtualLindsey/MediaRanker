module ApplicationHelper
  def find_user(id)
    return User.find(id).name
  end

  def votes_for_work(work)
    return Vote.where(work_id: work.id).count
  end

  def top_10_albums
      @albums = Work.where(category: 'album')
  end
end

class HitFoxHub
  def initialize
    @github = Github.new
  end

  def repos
    @github.repos.list user: 'nic-lan'
  end
end

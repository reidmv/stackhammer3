Facter.add(:app_version) do
  setcode do
    File.read('/app/version.txt').chomp if File.exists?('/app/version.txt')
  end
end

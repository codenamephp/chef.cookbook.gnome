# frozen_string_literal: true

describe package('gnome-core') do
  it { should be_installed }
end

describe package('gnome-tweaks') do
  it { should be_installed }
end

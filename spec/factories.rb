FactoryGirl.define do
	factory :user do
		name		"Jason Hall"
		email		"jhall@ambientdevices.com"
		password	"foobar"
		password_confirmation "foobar"
	end
end
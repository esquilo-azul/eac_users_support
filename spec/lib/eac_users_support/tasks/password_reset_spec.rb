# frozen_string_literal: true

RSpec.describe ::EacUsersSupport::Tasks::PasswordReset do
  describe '#run' do
    let(:user_email) { 'fulano@example.com' }

    context 'user not exist' do
      it 'no user should be found' do
        expect(::EacUsersSupport::User.find_by(email: user_email)).to be_nil
      end

      context 'after first run' do
        before(:each) { described_class.new(user_email).run }
        let(:user) { ::EacUsersSupport::User.find_by(email: user_email) }

        it 'user should be exist' do
          expect(user).to be_a(::EacUsersSupport::User)
        end

        it 'password should match email' do
          expect(user.valid_password?(user_email)).to be_truthy
        end

        context 'password changed' do
          let(:new_password) { 'my_new_password' }
          before(:each) { user.update!(password: new_password) }

          it 'password should not match email' do
            expect(user.valid_password?(user_email)).to be_falsey
          end

          context 'after second run' do
            before(:each) { described_class.new(user_email).run }
            let(:user2) { ::EacUsersSupport::User.find_by(email: user_email) }

            it 'user should be same as previous' do
              expect(user2.id).to be(user.id)
            end

            it 'password should match email' do
              expect(user2.valid_password?(user_email)).to be_truthy
            end
          end
        end
      end
    end
  end
end

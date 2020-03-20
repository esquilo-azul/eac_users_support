# frozen_string_literal: true

RSpec.describe ::EacUsersSupport::Tasks::PasswordReset do
  describe '#run' do
    let(:user_email) { 'fulano@example.com' }

    context 'when user not exist' do
      it 'no user should be found' do
        expect(::EacUsersSupport::User.find_by(email: user_email)).to be_nil
      end

      context 'after first run with no administrator flag' do # rubocop:disable RSpec/ContextWording
        before { described_class.new(user_email, false).run }

        let(:user) { ::EacUsersSupport::User.find_by(email: user_email) }

        it 'user should be exist' do
          expect(user).to be_a(::EacUsersSupport::User)
        end

        it 'password should match email' do
          expect(user).to be_valid_password(user_email)
        end

        it 'user should not be administrator' do
          expect(user.administrator).to be_falsey
        end

        context 'when password changed' do
          let(:new_password) { 'my_new_password' }

          before { user.update!(password: new_password) }

          it 'password should not match email' do
            expect(user).not_to be_valid_password(user_email)
          end

          context 'after second run with administrator flag' do # rubocop:disable RSpec/ContextWording
            before { described_class.new(user_email, true).run }

            let(:user2) { ::EacUsersSupport::User.find_by(email: user_email) }

            it 'user should be same as previous' do
              expect(user2.id).to be(user.id)
            end

            it 'password should match email' do
              expect(user2).to be_valid_password(user_email)
            end

            it 'user should be administrator' do
              expect(user2.administrator).to be_truthy
            end
          end
        end
      end
    end
  end
end

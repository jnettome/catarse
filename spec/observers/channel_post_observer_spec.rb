require 'spec_helper'

describe ChannelPostObserver do
  let(:channel_post) { create(:channel_post, visible: false) }
  let(:user) { create(:user) }

  describe 'after_save' do
    before do
      channel_post.channel.subscribers << user
      ActionMailer::Base.deliveries = []
    end

    context "when post is not published" do
      before do
        ChannelPostNotification.should_receive(:notify_once).with(
          :channel_post,
          user,
          channel_post,
          {
            from_email: channel_post.channel.email,
            from_name: channel_post.channel.name
          }
        ).never
      end

      it 'should not fill published at field' do
        channel_post.published_at.should be_nil
      end

      it 'should not call Notification.notify once' do
        channel_post.update_attributes(visible: false)
      end
    end

    context "when post is published" do
      before do
        ChannelPostNotification.should_receive(:notify_once).with(
          :channel_post,
          user,
          channel_post,
          {
            from_email: channel_post.channel.email,
            from_name: channel_post.channel.name
          }
        ).once.and_call_original
      end

      it 'should call Notification.notify once' do
        channel_post.update_attributes(visible: true)
      end

      it 'should fill published at field' do
        channel_post.update_attributes(visible: true)
        channel_post.published_at.should_not be_nil
      end
    end
  end
end

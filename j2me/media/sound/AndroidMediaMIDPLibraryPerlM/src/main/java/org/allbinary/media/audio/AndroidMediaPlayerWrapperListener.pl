# Generated Code Do Not Modify

package org::allbinary::media::audio::AndroidMediaPlayerWrapperListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{androidMediaPlayerWrapper} = $org::allbinary::media::audio::AndroidMediaPlayerWrapper::NULL_ANDROID_MEDIA_PLAYER_WRAPPER;
    $self->{mOnBufferingUpdateListener} = 'org::allbinary::media::audio::AndroidMediaPlayerOnBufferingUpdateListener'->new($self);
    $self->{mOnPreparedListener} = 'org::allbinary::media::audio::AndroidMediaPlayerOnPreparedListener'->new($self);
    $self->{mOnErrorListener} = 'org::allbinary::media::audio::AndroidMediaPlayerOnErrorListener'->new($self);
    $self->{mOnCompletionListener} = 'org::allbinary::media::audio::AndroidMediaPlayerOnCompletionListener'->new($self);
}


sub new {
    my ($class, $androidMediaPlayerWrapper) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
            $self->{androidMediaPlayerWrapper} = $androidMediaPlayerWrapper;
            my $mediaPlayer = $androidMediaPlayerWrapper->getMediaPlayer();
            $mediaPlayer->setOnCompletionListener($self->{mOnCompletionListener});
            $mediaPlayer->setOnBufferingUpdateListener($self->{mOnBufferingUpdateListener});
            $mediaPlayer->setOnPreparedListener($self->{mOnPreparedListener});
            $mediaPlayer->setOnErrorListener($self->{mOnErrorListener});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
        }
    return $self;
}
{
    package org::allbinary::media::audio::MediaPlayerOnBufferingUpdateListener;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'MediaPlayer::OnBufferingUpdateListener';
    

    sub new {
        my ($class) = @_;
        my $self = bless({}, $class);
        return $self;
    }
    

    sub onBufferingUpdate {
        my ($self, $mediaPlayer, $i) = @_;
    }
    }

{
    package org::allbinary::media::audio::MediaPlayerOnPreparedListener;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'MediaPlayer::OnPreparedListener';
    

    sub new {
        my ($class) = @_;
        my $self = bless({}, $class);
        return $self;
    }
    

    sub onPrepared {
        my ($self, $mp) = @_;
    }
    }

{
    package org::allbinary::media::audio::MediaPlayerOnErrorListener;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'MediaPlayer::OnErrorListener';
    

    sub new {
        my ($class) = @_;
        my $self = bless({}, $class);
        return $self;
    }
    

    sub onError {
        my ($self, $mp, $what, $extra) = @_;
            return 0;
    }
    }

{
    package org::allbinary::media::audio::MediaPlayerOnCompletionListener;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'MediaPlayer::OnCompletionListener';
    

    sub new {
        my ($class) = @_;
        my $self = bless({}, $class);
        return $self;
    }
    

    sub onCompletion {
        my ($self, $mp) = @_;
    }
    }

{
    package org::allbinary::media::audio::AndroidMediaPlayerOnBufferingUpdateListener;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::media::audio::MediaPlayerOnBufferingUpdateListener';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{ON_BUFFERING_UPDATE} = "onBufferingUpdate()";
        $self->{androidMediaPlayerWrapperListener} = undef;
    }
    

    sub new {
        my ($class, $androidMediaPlayerWrapperListener) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{androidMediaPlayerWrapperListener} = $androidMediaPlayerWrapperListener;
        return $self;
    }
    

    sub onBufferingUpdate {
        my ($self, $mediaPlayer, $i) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            $logUtil->putF('org::allbinary::logic::string::StringMaker'->new()->append("Update buffer: ")->appendint($i)->append("%")->toString(), $self, $self->{ON_BUFFERING_UPDATE});
            $self->{androidMediaPlayerWrapperListener}->{androidMediaPlayerWrapper}->update($javax::microedition::media::PlayerListener::DEVICE_UNAVAILABLE);
    }
    }

{
    package org::allbinary::media::audio::AndroidMediaPlayerOnPreparedListener;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::media::audio::MediaPlayerOnPreparedListener';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{ON_PREPARE} = "onPrepare()";
        $self->{androidMediaPlayerWrapperListener} = undef;
    }
    

    sub new {
        my ($class, $androidMediaPlayerWrapperListener) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{androidMediaPlayerWrapperListener} = $androidMediaPlayerWrapperListener;
        return $self;
    }
    

    sub onPrepared {
        my ($self, $mp) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $logUtil->putF($commonStrings->{START}, $self, $self->{ON_PREPARE});
            $self->{androidMediaPlayerWrapperListener}->{androidMediaPlayerWrapper}->update($javax::microedition::media::PlayerListener::DEVICE_AVAILABLE);
    }
    }

{
    package org::allbinary::media::audio::AndroidMediaPlayerOnErrorListener;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::media::audio::MediaPlayerOnErrorListener';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{ON_ERROR} = "onError()";
        $self->{androidMediaPlayerWrapperListener} = undef;
    }
    

    sub new {
        my ($class, $androidMediaPlayerWrapperListener) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{androidMediaPlayerWrapperListener} = $androidMediaPlayerWrapperListener;
        return $self;
    }
    

    sub onError {
        my ($self, $mp, $what, $extra) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            $logUtil->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append("What: ")->appendint($what)->append(" Extra: ")->appendint($extra)->toString(), $self, $self->{ON_ERROR});
            $self->{androidMediaPlayerWrapperListener}->{androidMediaPlayerWrapper}->update($javax::microedition::media::PlayerListener::ERROR);
            return 1;
    }
    }

{
    package org::allbinary::media::audio::AndroidMediaPlayerOnCompletionListener;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::media::audio::MediaPlayerOnCompletionListener';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{ON_COMPLETE} = "onComplete()";
        $self->{androidMediaPlayerWrapperListener} = undef;
    }
    

    sub new {
        my ($class, $androidMediaPlayerWrapperListener) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{androidMediaPlayerWrapperListener} = $androidMediaPlayerWrapperListener;
        return $self;
    }
    

    sub onCompletion {
        my ($self, $mp) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $logUtil->putF($commonStrings->{START}, $self, $self->{ON_COMPLETE});
            $self->{androidMediaPlayerWrapperListener}->{androidMediaPlayerWrapper}->update($javax::microedition::media::PlayerListener::END_OF_MEDIA);
    }
    }


# use javax::microedition::media::PlayerListener;
use android::media::MediaPlayer;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::audio::AndroidMediaPlayerWrapper;

1;


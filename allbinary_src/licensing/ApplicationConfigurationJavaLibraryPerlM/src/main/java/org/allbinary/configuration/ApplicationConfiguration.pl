# Generated Code Do Not Modify

package org::allbinary::configuration::ApplicationConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{fullscreen} = 1;
    $self->{showTitleBar} = 0;
    $self->{progressBarView} = 0;
    $self->{FILE} = "ReloadConfiguration.dat";
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::configuration::ApplicationConfiguration::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::configuration::ApplicationConfiguration::instance = 'org::allbinary::configuration::ApplicationConfiguration'->new();
        }
        return $org::allbinary::configuration::ApplicationConfiguration::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            if ('org::allbinary::logic::io::file::FileFactory'->getInstance()->isFile($self->{FILE})) {
                $self->read();
            } else {
                $self->write();
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
        }
    return $self;
}


# throws Exception
sub read {
    my ($self) = @_;
        my $fileInputStreamFactory = 'org::allbinary::logic::io::FileStreamFactory'->getInstance();
        my $fileInputStream = $fileInputStreamFactory->getFileInputStreamInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $self->{FILE});
        my $dataInputStream = 'org::allbinary::logic::io::AbDataInputStream'->new($fileInputStream);
        my $fullScreen = $dataInputStream->readInt();
        if ($fullScreen == 0) {
            $self->setFullscreen(0);
        } elsif ($fullScreen == 1) {
            $self->setFullscreen(1);
        } else {
            die ("Invalid FullScreen ActivityConfiguration");
        }
        my $progressBarView = $dataInputStream->readInt();
        if ($progressBarView == 0) {
            $self->setProgressBarView(0);
        } elsif ($progressBarView == 1) {
            $self->setProgressBarView(1);
        } else {
            die ("Invalid ProgressBarView ActivityConfiguration");
        }
        my $showTitleBar = $dataInputStream->readInt();
        if ($showTitleBar == 0) {
            $self->setShowTitleBar(0);
        } elsif ($showTitleBar == 1) {
            $self->setShowTitleBar(1);
        } else {
            die ("Invalid ShowTitleBar ActivityConfiguration");
        }
        $self->{logUtil}->putF("Read Configuration: " . $self->toString(), $self, "read");
}


# throws Exception
sub write {
    my ($self) = @_;
        my $closeable = $org::allbinary::logic::io::NullCloseable::NULL_CLOSEABLE;
        try {
            $self->{logUtil}->putF("Write Configuration: " . $self->toString(), $self, "write");
            my $fileInputStreamFactory = 'org::allbinary::logic::io::FileStreamFactory'->getInstance();
            my $fileOutputStream = $fileInputStreamFactory->getFileOutputStreamInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $self->{FILE});
            my $dataOutputStream = 'org::allbinary::logic::io::AbDataOutputStream'->new($fileOutputStream);
            $closeable = $dataOutputStream;
            if ($self->isFullscreen()) {
                $dataOutputStream->writeInt(1);
            } else {
                $dataOutputStream->writeInt(0);
            }
            if ($self->isProgressBarView()) {
                $dataOutputStream->writeInt(1);
            } else {
                $dataOutputStream->writeInt(0);
            }
            if ($self->isShowTitleBar()) {
                $dataOutputStream->writeInt(1);
            } else {
                $dataOutputStream->writeInt(0);
            }
            $dataOutputStream->flush();
        } catch ($e) {
            die $e;
        } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($closeable);
        }
}


# throws Exception
sub update {
    my ($self, $gameFeature) = @_;
        if ($gameFeature == 'org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{FULL_SCREEN}) {
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            if ($features->isFeature($gameFeature)) {
                if (!$self->isFullscreen()) {
                    $self->setFullscreen(1);
                    $self->write();
                }
            } else {
                if ($self->isFullscreen()) {
                    $self->setFullscreen(0);
                    $self->write();
                }
            }
        }
}


sub setFullscreen {
    my ($self, $fullscreen) = @_;
        $self->{fullscreen} = $fullscreen;
}


sub isFullscreen {
    my ($self) = @_;
        return $self->{fullscreen};
}


sub setShowTitleBar {
    my ($self, $showTitleBar) = @_;
        $self->{showTitleBar} = $showTitleBar;
}


sub isShowTitleBar {
    my ($self) = @_;
        return $self->{showTitleBar};
}


sub setProgressBarView {
    my ($self, $progressBarView) = @_;
        $self->{progressBarView} = $progressBarView;
}


sub isProgressBarView {
    my ($self) = @_;
        return $self->{progressBarView};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("isFullscreen: ");
        $stringBuffer->appendboolean($self->isFullscreen());
        $stringBuffer->append(" isProgressBarView: ");
        $stringBuffer->appendboolean($self->isProgressBarView());
        $stringBuffer->append(" isShowTitleBar: ");
        $stringBuffer->appendboolean($self->isShowTitleBar());
        return $stringBuffer->toString();
}

# use java::io::Closeable;
# use java::io::InputStream;
# use java::io::OutputStream;
use org::allbinary::game::configuration::feature::Feature;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::AbDataInputStream;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::FileStreamFactory;
use org::allbinary::logic::io::NullCloseable;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::FileFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;

1;


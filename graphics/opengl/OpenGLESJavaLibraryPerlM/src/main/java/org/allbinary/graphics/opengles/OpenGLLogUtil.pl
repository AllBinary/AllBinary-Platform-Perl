# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::OpenGLLogUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::opengles::OpenGLLogUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{MAX_TEXTURE} = " Max Texture Size: ";
    $self->{LOG_ERROR} = "logError";
    $self->{IMAGE} = " Image: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::OpenGLLogUtil::instance;
}


sub logError {
    my ($self, $gl) = @_;
        my $error = $gl->glGetError();
        if ($error != $javax::microedition::khronos::opengles::GL10::GL_NO_ERROR) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::image::opengles::OpenGLStrings'->getInstance()->{GL_ERROR_LABEL});
            $stringBuffer->appendint($error);
            if ($error == 1281) {
                $stringBuffer->append($self->{MAX_TEXTURE});
                my $maxTextureSize = [(0) x (1)];
                $gl->glGetIntegerv($javax::microedition::khronos::opengles::GL10::GL_MAX_TEXTURE_SIZE, $maxTextureSize, 0);
                $stringBuffer->appendint($maxTextureSize->[0]);
            }
            if ($error == 1280) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->toString(), $self, 'org::allbinary::image::opengles::OpenGLStrings'->getInstance()->{SET});
            } else {
                'org::allbinary::logic::communication::log::ForcedLogUtil'->log($stringBuffer->toString(), $self);
            }
        }
}


# Java overloaded method: Perl keeps the last definition
sub logError {
    my ($self, $gl, $image) = @_;
        my $error = $gl->glGetError();
        if ($error != $javax::microedition::khronos::opengles::GL10::GL_NO_ERROR) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::image::opengles::OpenGLStrings'->getInstance()->{GL_ERROR_LABEL});
            $stringBuffer->appendint($error);
            if ($error == 1281) {
                $stringBuffer->append($self->{MAX_TEXTURE});
                my $maxTextureSize = [(0) x (1)];
                $gl->glGetIntegerv($javax::microedition::khronos::opengles::GL10::GL_MAX_TEXTURE_SIZE, $maxTextureSize, 0);
                $stringBuffer->appendint($maxTextureSize->[0]);
            }
            $stringBuffer->append($self->{IMAGE});
            $stringBuffer->append($image->toString());
            'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->toString(), $self, $self->{LOG_ERROR});
        }
}

# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Image;
use org::allbinary::image::opengles::OpenGLStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;

1;


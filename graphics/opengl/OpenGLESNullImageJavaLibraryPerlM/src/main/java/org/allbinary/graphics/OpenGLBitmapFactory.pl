# Generated Code Do Not Modify

package org::allbinary::graphics::OpenGLBitmapFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::platform::graphics::PlatformBitmapBaseFactory';

our $instance = 'org::allbinary::graphics::OpenGLBitmapFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{ARGB_8888} = 'org::allbinary::graphics::Config'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::OpenGLBitmapFactory::instance;
}


sub createBitmap {
    my ($self, $width, $height, $config) = @_;
        return 'org::allbinary::graphics::OpenGLBitmap'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}


# throws IOException
sub decodeStream {
    my ($self, $inputStream) = @_;
        return 'org::allbinary::graphics::OpenGLBitmap'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}


# Java overloaded method: Perl keeps the last definition
sub createBitmap {
    my ($self, $image) = @_;
        return 'org::allbinary::graphics::OpenGLBitmap'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}
{
    package org::allbinary::graphics::Config;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{bitmapConfig} = undef;
    }
    

    sub new {
        my ($class, $bitmapConfig) = @_;
        my $self = bless({}, $class);
        $self->_init_fields();
            $self->{bitmapConfig} = $bitmapConfig;
        return $self;
    }
    }


# use java::io::IOException;
# use java::io::InputStream;
# use javax::microedition::lcdui::Image;
use org::allbinary::logic::NullUtil;
use org::allbinary::platform::graphics::PlatformBitmapBase;
use org::allbinary::platform::graphics::PlatformBitmapBaseFactory;
use org::allbinary::graphics::OpenGLBitmap;

1;


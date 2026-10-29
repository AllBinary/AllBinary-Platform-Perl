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
    $self->{ARGB_8888} = 'org::allbinary::graphics::Config'->new($android::graphics::Bitmap::Config->{ARGB_8888});
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
        return 'org::allbinary::graphics::OpenGLBitmap'->new('android::graphics::Bitmap'->createBitmap($width, $height, $config->{bitmapConfig}));
}


# throws IOException
sub decodeStream {
    my ($self, $inputStream) = @_;
        return 'org::allbinary::graphics::OpenGLBitmap'->new('android::graphics::BitmapFactory'->decodeStream($inputStream));
}


# Java overloaded method: Perl keeps the last definition
sub createBitmap {
    my ($self, $image) = @_;
        return 'org::allbinary::graphics::OpenGLBitmap'->new(($image)->getBitmap());
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


# use java::io::InputStream;
# use javax::microedition::lcdui::Image;
use android::graphics::Bitmap;
use android::graphics::BitmapFactory;
# use java::io::IOException;
use org::allbinary::platform::graphics::PlatformBitmapBaseFactory;
use org::allbinary::platform::graphics::PlatformBitmapBase;
use org::microemu::android::device::AndroidImageInterface;
use org::allbinary::graphics::OpenGLBitmap;

1;


# Generated Code Do Not Modify

package org::allbinary::graphics::OpenGLBitmapFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::platform::graphics::PlatformBitmapBaseFactory';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::graphics::OpenGLBitmapFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{ARGB_8888} = 'org::allbinary::graphics::OpenGLBitmapConfig'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::OpenGLBitmapFactory::instance;
}


sub createBitmap_j3 {
    my ($self, $width, $height, $config) = @_;
        return 'org::allbinary::graphics::OpenGLBitmap'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}


# throws IOException
sub decodeStream {
    my ($self, $inputStream) = @_;
        return 'org::allbinary::graphics::OpenGLBitmap'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}


sub createBitmap_j1 {
    my ($self, $image) = @_;
        return 'org::allbinary::graphics::OpenGLBitmap'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}

sub createBitmap {
    my ($invocant, @arguments) = @_;
    return $invocant->createBitmap_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->createBitmap_j1(@arguments) if scalar(@arguments) == 1;
    die "No method createBitmap takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::IOException ();
# use java::io::InputStream ();
use javax::microedition::lcdui::Image ();
use org::allbinary::logic::NullUtil ();
use org::allbinary::platform::graphics::PlatformBitmapBase ();
use org::allbinary::platform::graphics::PlatformBitmapBaseFactory ();
use org::allbinary::graphics::OpenGLBitmapConfig ();
use org::allbinary::graphics::OpenGLBitmap ();

1;


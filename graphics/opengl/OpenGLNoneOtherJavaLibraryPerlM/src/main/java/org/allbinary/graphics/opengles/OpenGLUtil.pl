# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::OpenGLUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::graphics::opengles::OpenGLUtil'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::OpenGLUtil::instance;
}


sub addImage {
    my ($self, $image) = @_;
        return $image;
}


sub clear {
    my ($self) = @_;
}


sub addRunnable {
    my ($self, $runnable) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::Image ();

1;


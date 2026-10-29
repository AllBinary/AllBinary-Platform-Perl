# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::OpenGLUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::opengles::OpenGLUtil'->new();

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

# use javax::microedition::lcdui::Image;

1;


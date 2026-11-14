# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::OpenGLThreadUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::graphics::opengles::OpenGLThreadUtil'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::OpenGLThreadUtil::instance;
}


sub set {
    my ($self, $glSurfaceView) = @_;
}


sub onPause {
    my ($self) = @_;
}


sub onResume {
    my ($self) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;


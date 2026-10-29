# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::NullOpenGLProcessorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::opengles::OpenGLProcessor'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::NullOpenGLProcessorFactory::instance;
}

use org::allbinary::graphics::opengles::OpenGLProcessor;

1;


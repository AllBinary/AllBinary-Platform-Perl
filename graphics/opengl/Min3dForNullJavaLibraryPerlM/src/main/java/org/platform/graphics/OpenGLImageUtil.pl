# Generated Code Do Not Modify

package org::platform::graphics::OpenGLImageUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::image::opengles::OpenGLImageUtilBase';

our $instance = 'org::platform::graphics::OpenGLImageUtil'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::platform::graphics::OpenGLImageUtil::instance;
}

use org::allbinary::image::opengles::OpenGLImageUtilBase;

1;


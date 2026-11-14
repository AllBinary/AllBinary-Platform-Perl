# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::NullOpenGLProcessorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::graphics::opengles::OpenGLProcessor'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::NullOpenGLProcessorFactory::instance;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::graphics::opengles::OpenGLProcessor ();

1;


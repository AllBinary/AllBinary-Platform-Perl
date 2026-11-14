# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::EnableFacesShaderOpenGLProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::threed::min3d::renderer::processor::ObjectThreedOpenGLProcessor';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::graphics::opengles::EnableFacesShaderOpenGLProcessor'->new() };


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::EnableFacesShaderOpenGLProcessor::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub process {
    my ($self, $gl, $anyType) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::khronos::opengles::GL10 ();
use org::allbinary::graphics::threed::min3d::renderer::processor::ObjectThreedOpenGLProcessor ();

1;


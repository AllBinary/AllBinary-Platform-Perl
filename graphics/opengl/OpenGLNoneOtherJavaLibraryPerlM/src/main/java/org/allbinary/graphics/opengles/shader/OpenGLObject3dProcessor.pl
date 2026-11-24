# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::shader::OpenGLObject3dProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub process_j2 {
    my ($self, $gl, $object3d) = @_;
}


sub process_j3 {
    my ($self, $gl, $object3d, $index) = @_;
}

sub process {
    my ($invocant, @arguments) = @_;
    return $invocant->process_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->process_j3(@arguments) if scalar(@arguments) == 3;
    die "No method process takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use javax::microedition::khronos::opengles::GL10 ();
use org::allbinary::string::CommonStrings ();

1;


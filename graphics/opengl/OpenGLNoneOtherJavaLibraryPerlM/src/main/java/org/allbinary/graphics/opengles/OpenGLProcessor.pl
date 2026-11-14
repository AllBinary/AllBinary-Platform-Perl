# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::OpenGLProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub process {
    my ($self, $gl) = @_;
}

use java::lang::Object ();
use javax::microedition::khronos::opengles::GL10 ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();

1;


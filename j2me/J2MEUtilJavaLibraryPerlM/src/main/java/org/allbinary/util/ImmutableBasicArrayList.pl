#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::util::ImmutableBasicArrayList;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::util::BasicArrayListS';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
}


sub new {
    my ($class, $name, $size) = @_;
    my $self = $class->SUPER::new($size);
    $self->_init_fields();
        # super(...) made $self above
        $self->{name} = $name;
    return $self;
}


sub add {
    my ($self, $e) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{name}, $self);
        return 1;
}


sub addAt {
    my ($self, $index, $element) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{name}, $self);
}


sub toString {
    my ($self) = @_;
        return $self->{name};
}

use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::util::BasicArrayListS;

1;


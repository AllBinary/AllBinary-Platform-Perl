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

package org::allbinary::logic::util::cache::KeylessBasicArrayListCache;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::IndexedBasicArrayListCache';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub get {
    my ($self) = @_;
        try {
            if ($self->{index} >= $self->{list}->size()) {
                $self->addDefault();
            }
            my $list = $self->getAt($self->{index}++);
            return $list;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{GET}, $e);
            return $self->{basicArrayListUtil}->getImmutableInstance();
        }
}


sub clear {
    my ($self) = @_;
        $self->SUPER::clear();
        my $basicArrayList = undef;
        for (my $index = $self->{list}->size() - 1; $index >= 0; $index--) {
            $basicArrayList = ($self->{list}->{objectArray}->[$index]);
            $basicArrayList->clear();
        }
}


sub log {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("S: ");
        $stringBuffer->appendint($self->{list}->size());
        my $S_LABEL = " s: ";
        my $basicArrayList = undef;
        for (my $index = $self->{list}->size() - 1; $index >= 0; $index--) {
            $stringBuffer->append($S_LABEL);
            $basicArrayList = ($self->{list}->{objectArray}->[$index]);
            $stringBuffer->appendint($basicArrayList->size());
        }
        return $stringBuffer->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::logic::util::cache::IndexedBasicArrayListCache;

1;


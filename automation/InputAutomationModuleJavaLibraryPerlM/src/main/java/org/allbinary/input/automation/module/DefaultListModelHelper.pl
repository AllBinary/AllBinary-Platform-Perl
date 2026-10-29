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

package org::allbinary::input::automation::module::DefaultListModelHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{defaultListModel} = undef;
    $self->{vector} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{vector} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{defaultListModel} = 'org::allbinary::input::automation::module::DefaultListModel'->new();
    return $self;
}


sub initDefaultModelList {
    my ($self) = @_;
        $self->{defaultListModel} = 'org::allbinary::input::automation::module::DefaultListModel'->new();
        my $size = $self->{vector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $moduleName = $self->{vector}->get($index);
            $self->{defaultListModel}->addElement($moduleName);
        }
}


sub getListModel {
    my ($self) = @_;
        return $self->{defaultListModel};
}


sub add {
    my ($self, $string) = @_;
        $self->{vector}->add($string);
}


sub remove {
    my ($self, $string) = @_;
        $self->{vector}->remove($string);
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::swing;
use org::allbinary::logic::StdUtil;
use org::allbinary::input::automation::module::DefaultListModel;

1;


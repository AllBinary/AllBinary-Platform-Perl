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

package org::allbinary::gui::swing::workers::JListSwingWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::gui::swing::workers::SwingWorker';


sub _init_fields {
    my ($self) = @_;
    $self->{jList} = undef;
    $self->{listModel} = undef;
}


sub new {
    my ($class, $jList, $listModel) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setJList($jList);
        $self->setListModel($listModel);
    return $self;
}


sub doInBackground {
    my ($self) = @_;
        return undef;
}


sub done {
    my ($self) = @_;
        $self->getJList()->setModel($self->getListModel());
}


sub getJList {
    my ($self) = @_;
        return $self->{jList};
}


sub setJList {
    my ($self, $jList) = @_;
        $self->{jList} = $jList;
}


sub getListModel {
    my ($self) = @_;
        return $self->{listModel};
}


sub setListModel {
    my ($self, $listModel) = @_;
        $self->{listModel} = $listModel;
}

# use javax::swing;
use org::allbinary::gui::swing::workers::SwingWorker;

1;


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

package org::allbinary::input::automation::actions::script::ProfileActionScriptItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::tree::DefaultMutableTreeNode','org::allbinary::input::automation::actions::script::ProfileActionScriptItemInterface','java::awt::event::ActionListener';

our $EDIT = "Edit";
our $DELETE = "Delete";
our $NEW_CONDITION = "New Condition";
our $NEW_INPUT = "New Input";
our $NEW_OUTPUT = "New Output";
our $NEW_COLOR_AT = "Color At";
our $NEW_TIME_INTERVAL = "Time Interval";
our $NEW_ALWAYS = "Always On/Off";
our $NEW_KEY_INPUT = "Key";
our $NEW_MOUSE_INPUT = "Mouse";
our $NEW_JOYSTICK_INPUT = "Joystick";
our $NEW_IMAGE_OUTPUT = "Image";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{jPopupMenu} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of ProfileActionScriptItem takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $label, $node) = @_;
    my $self = $class->SUPER::new($label);
    $self->_init_fields();
        # super(...) made $self above
        $self->init();
        $self->{logUtil}->putF("Label: " . $label, $self, $self->{commonStrings}->{CONSTRUCTOR});
    return $self;
}


sub _new1 {
    my ($class, $label) = @_;
    my $self = $class->SUPER::new($label);
    $self->_init_fields();
        # super(...) made $self above
        $self->init();
        $self->{logUtil}->putF("Label: " . $label, $self, $self->{commonStrings}->{CONSTRUCTOR});
    return $self;
}


sub init {
    my ($self) = @_;
        $self->setJPopupMenu('org::allbinary::input::automation::actions::script::JPopupMenu'->new());
        my $jMenuItemEdit = 'org::allbinary::input::automation::actions::script::JMenuItem'->new($EDIT);
        my $jMenuItemDelete = 'org::allbinary::input::automation::actions::script::JMenuItem'->new($DELETE);
        $jMenuItemEdit->addActionListener($self);
        $jMenuItemDelete->addActionListener($self);
        $self->getJPopupMenu()->add($jMenuItemEdit);
        $self->getJPopupMenu()->add($jMenuItemDelete);
}


# throws Exception
sub process {
    my ($self, $frame) = @_;
        die ("RuntimeException");
}


sub getJPopupMenu {
    my ($self) = @_;
        return $self->{jPopupMenu};
}


sub showDialog {
    my ($self) = @_;
        die ("RuntimeException");
}


sub actionPerformed {
    my ($self, $actionEvent) = @_;
        if ($actionEvent->getActionCommand()->compareTo($org::allbinary::input::automation::actions::script::ProfileActionScriptItem::EDIT) == 0) {
            $self->showDialog();
        }
}


sub setJPopupMenu {
    my ($self, $jPopupMenu) = @_;
        $self->{jPopupMenu} = $jPopupMenu;
}

# use java::awt::event::ActionEvent;
# use java::awt::event::ActionListener;
# use javax::swing;
# use javax::swing::tree::DefaultMutableTreeNode;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Node;
use org::allbinary::input::automation::actions::script::ProfileActionScriptItemInterface;
use org::allbinary::input::automation::actions::script::JPopupMenu;
use org::allbinary::input::automation::actions::script::JMenuItem;

1;


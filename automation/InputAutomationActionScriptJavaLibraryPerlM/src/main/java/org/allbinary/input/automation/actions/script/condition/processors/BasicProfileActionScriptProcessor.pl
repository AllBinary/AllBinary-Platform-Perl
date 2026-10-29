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

package org::allbinary::input::automation::actions::script::condition::processors::BasicProfileActionScriptProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'org::allbinary::input::automation::actions::script::ProfileActionScriptItem','org::allbinary::input::automation::actions::script::condition::processors::ProfileActionScriptProcessorInterface';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of BasicProfileActionScriptProcessor takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $label, $node) = @_;
    my $self = $class->SUPER::new($label, $node);
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $label) = @_;
    my $self = $class->SUPER::new($label);
        # super(...) made $self above
    return $self;
}


sub actionPerformed {
    my ($self, $actionEvent) = @_;
        $self->SUPER::actionPerformed($actionEvent);
        if ($actionEvent->getActionCommand()->compareTo($self->{DELETE}) == 0) {
            if ((Scalar::Util::blessed($self->getParent()) && $self->getParent()->isa('org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionInterface'))) {
                my $profileActionScriptConditionInterface = $self->getParent();
                $profileActionScriptConditionInterface->removeProcessor($self);
                'org::allbinary::input::automation::actions::script::JTreeInterfaceFactory'->getInstance()->getJTreeInterface()->updateJTree();
            }
        }
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement($org::allbinary::input::automation::actions::script::condition::processors::GenericProfileActionScriptProcessorData::NAME);
        return $node;
}

# use java::awt::event::ActionEvent;
use org::allbinary::input::automation::actions::script::JTreeInterfaceFactory;
use org::allbinary::input::automation::actions::script::ProfileActionScriptItem;
use org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::input::automation::actions::script::condition::processors::ProfileActionScriptProcessorInterface;
use org::allbinary::input::automation::actions::script::condition::processors::GenericProfileActionScriptProcessorData;

1;


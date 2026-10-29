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

package org::allbinary::graphics::form::item::validation::TextItemUserIdentifierVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::visitor::Visitor';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub visit {
    my ($self, $anyType) = @_;
        my $value = $anyType;
        if (length($value) < 2) {
            my $charValue = substr($value, 0, 1);
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            if ($stringValidationUtil->isNumber($value)) {
                return 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE};
            } elsif ($self->isLetter($charValue)) {
                return 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE};
            } else {
                try {
                    'org::allbinary::game::input::TextNotificationUtil'->getInstance()->fireError("Only Letters & Numbers Allowed");
                } catch ($e) {
                    my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                    $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{VISIT}, $e);
                }
                return 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE};
            }
        } else {
            return 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE};
        }
}


sub isLetter {
    my ($self, $charValue) = @_;
        my $value = ord($charValue);
        return ($value > 64 && $value < 91) || ($value > 96 && $value < 123);
}

use org::allbinary::game::input::TextNotificationUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::util::visitor::Visitor;
use org::allbinary::string::CommonStrings;

1;


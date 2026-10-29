# Generated Code Do Not Modify

package org::allbinary::game::input::AndroidGameKey;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::Input';



sub new {
    my ($class, $keyCode, $name) = @_;
    my $self = $class->SUPER::new($keyCode, $name);
        # super(...) made $self above
        my $inputFactory = 'org::allbinary::game::input::InputFactory'->getInstance();
        $inputFactory->{inputIntegerArray}->[$self->getId()] = $self;
    return $self;
}


sub toString {
    my ($self) = @_;
        return "AndroidGameKey: " . $self->SUPER::toString();
}


sub getString {
    my ($class, $keyCode) = @_;
        my $input = 'org::allbinary::game::input::InputFactory'->getInstance()->getInstanceById($keyCode);
        if (defined($input)) {
            return $input->getName();
        } else {
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        }
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputFactory;

1;


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

package org::allbinary::input::automation::module::game::MagicGameObject;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::game::MeteredGameObject','org::allbinary::input::automation::module::game::MagicGameObjectInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{MP_LABEL} = "MP:";
}


sub new {
    my ($class, $bufferedImage, $minX, $maxX, $y) = @_;
    my $self = $class->SUPER::new($bufferedImage, $minX, $maxX, $y);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append($self->{MP_LABEL});
        $stringBuffer->append($self->SUPER::toString());
        return $stringBuffer->toString();
}

# use java::awt::image::BufferedImage;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::input::automation::module::game::MeteredGameObject;
use org::allbinary::input::automation::module::game::MagicGameObjectInterface;

1;


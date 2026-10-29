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

package org::allbinary::image::gui::ImageIconUnique;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::image::gui::ImageIcon';


sub _init_fields {
    my ($self) = @_;
    $self->{id} = 0;
}


sub new {
    my ($class, $bufferedImage, $index) = @_;
    my $self = $class->SUPER::new($bufferedImage);
    $self->_init_fields();
        # super(...) made $self above
        $self->setId($index);
    return $self;
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}


sub setId {
    my ($self, $id) = @_;
        $self->{id} = $id;
}

# use java::awt::image::BufferedImage;
# use javax::swing;
use org::allbinary::image::gui::ImageIcon;

1;


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

package org::allbinary::image::gui::ImageJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{canvasStrings} = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance();
    $self->{isDrawn} = 0;
    $self->{bufferedImage} = undef;
}


sub new {
    my ($class, $bufferedImage) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
        $self->{bufferedImage} = $bufferedImage;
        $self->setSize($self->{bufferedImage}->getWidth(undef), $self->{bufferedImage}->getHeight(undef));
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        if (!$self->{isDrawn}) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{canvasStrings}->{PAINT});
            $graphics->drawImage($self->{bufferedImage}, 0, 0, $self->{bufferedImage}->getWidth(undef), $self->{bufferedImage}->getHeight(undef), undef);
            $self->{isDrawn} = 1;
        }
}


sub initComponents {
    my ($self) = @_;
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 400, 32767));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGap(0, 300, 32767));
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;


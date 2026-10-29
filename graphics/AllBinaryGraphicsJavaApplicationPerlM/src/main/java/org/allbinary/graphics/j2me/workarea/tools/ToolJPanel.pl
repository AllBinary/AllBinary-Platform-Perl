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

package org::allbinary::graphics::j2me::workarea::tools::ToolJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{arcJButton} = undef;
    $self->{charJButton} = undef;
    $self->{colorJList} = undef;
    $self->{colorJPanel} = undef;
    $self->{dottedArcJButton} = undef;
    $self->{dottedFillArcJButton} = undef;
    $self->{dottedFillRectJButton} = undef;
    $self->{dottedFillRountRectJButton} = undef;
    $self->{dottedLineJButton} = undef;
    $self->{dottedRectButton} = undef;
    $self->{fillArcJButton} = undef;
    $self->{fillRectJButton} = undef;
    $self->{fillRoundRectJButton} = undef;
    $self->{imageJButton} = undef;
    $self->{lineJButton} = undef;
    $self->{rectJButton} = undef;
    $self->{roundRectJButton} = undef;
    $self->{stringJButton} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
    return $self;
}


sub initComponents {
    my ($self) = @_;
        $self->{lineJButton} = 'javax::swing::JButton'->new();
        $self->{rectJButton} = 'javax::swing::JButton'->new();
        $self->{arcJButton} = 'javax::swing::JButton'->new();
        $self->{stringJButton} = 'javax::swing::JButton'->new();
        $self->{charJButton} = 'javax::swing::JButton'->new();
        $self->{roundRectJButton} = 'javax::swing::JButton'->new();
        $self->{imageJButton} = 'javax::swing::JButton'->new();
        $self->{fillArcJButton} = 'javax::swing::JButton'->new();
        $self->{fillRectJButton} = 'javax::swing::JButton'->new();
        $self->{fillRoundRectJButton} = 'javax::swing::JButton'->new();
        $self->{dottedLineJButton} = 'javax::swing::JButton'->new();
        $self->{dottedRectButton} = 'javax::swing::JButton'->new();
        $self->{dottedArcJButton} = 'javax::swing::JButton'->new();
        $self->{dottedFillRectJButton} = 'javax::swing::JButton'->new();
        $self->{dottedFillArcJButton} = 'javax::swing::JButton'->new();
        $self->{dottedFillRountRectJButton} = 'javax::swing::JButton'->new();
        $self->{colorJPanel} = 'javax::swing::JPanel'->new();
        $self->{colorJList} = 'javax::swing::JList'->new();
        $self->setLayout('java::awt::GridLayout'->new(17, 1));
        $self->{lineJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{lineJButton}->setText('org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem'->getStaticName());
        $self->{lineJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN66709 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mouseClicked {
                my ($self, $evt) = @_;
                $self->lineJButtonMouseClicked($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN66709'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN66709'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN66709')
        });
        $self->add($self->{lineJButton});
        $self->{rectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{rectJButton}->setText("Rect");
        $self->{rectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN66991 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mouseClicked {
                my ($self, $evt) = @_;
                $self->rectJButtonMouseClicked($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN66991'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN66991'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN66991')
        });
        $self->add($self->{rectJButton});
        $self->{arcJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{arcJButton}->setText("Arc");
        $self->{arcJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN67273 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->arcJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN67273'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN67273'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN67273')
        });
        $self->add($self->{arcJButton});
        $self->{stringJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{stringJButton}->setText("String");
        $self->{stringJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN67555 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->stringJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN67555'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN67555'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN67555')
        });
        $self->add($self->{stringJButton});
        $self->{charJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{charJButton}->setText("Char");
        $self->{charJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN67837 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->charJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN67837'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN67837'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN67837')
        });
        $self->add($self->{charJButton});
        $self->{roundRectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{roundRectJButton}->setText("Round Rect");
        $self->{roundRectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN68119 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->roundRectJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN68119'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN68119'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN68119')
        });
        $self->add($self->{roundRectJButton});
        $self->{imageJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{imageJButton}->setText("Image");
        $self->{imageJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN68401 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->imageJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN68401'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN68401'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN68401')
        });
        $self->add($self->{imageJButton});
        $self->{fillArcJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{fillArcJButton}->setText("Fill Arc");
        $self->{fillArcJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN68683 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->fillArcJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN68683'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN68683'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN68683')
        });
        $self->add($self->{fillArcJButton});
        $self->{fillRectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{fillRectJButton}->setText("Fill Rect");
        $self->{fillRectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN68965 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->fillRectJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN68965'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN68965'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN68965')
        });
        $self->add($self->{fillRectJButton});
        $self->{fillRoundRectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{fillRoundRectJButton}->setText("Fill Rnd Rect");
        $self->{fillRoundRectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN69247 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->fillRoundRectJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN69247'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN69247'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN69247')
        });
        $self->add($self->{fillRoundRectJButton});
        $self->{dottedLineJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedLineJButton}->setText("Dot Line");
        $self->{dottedLineJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN69529 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedLineJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN69529'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN69529'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN69529')
        });
        $self->add($self->{dottedLineJButton});
        $self->{dottedRectButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedRectButton}->setText("Dot Rect");
        $self->{dottedRectButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN69811 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedRectButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN69811'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN69811'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN69811')
        });
        $self->add($self->{dottedRectButton});
        $self->{dottedArcJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedArcJButton}->setText("Dot Arc");
        $self->{dottedArcJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN70093 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedArcJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN70093'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN70093'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN70093')
        });
        $self->add($self->{dottedArcJButton});
        $self->{dottedFillRectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedFillRectJButton}->setText("Dot Fill Rect");
        $self->{dottedFillRectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN70375 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedFillRectJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN70375'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN70375'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN70375')
        });
        $self->add($self->{dottedFillRectJButton});
        $self->{dottedFillArcJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedFillArcJButton}->setText("Dot Fill Arc");
        $self->{dottedFillArcJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN70657 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedFillArcJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN70657'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN70657'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN70657')
        });
        $self->add($self->{dottedFillArcJButton});
        $self->{dottedFillRountRectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedFillRountRectJButton}->setText("Dot Fill Rnd Rect");
        $self->{dottedFillRountRectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN70939 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedFillRountRectJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN70939'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN70939'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN70939')
        });
        $self->add($self->{dottedFillRountRectJButton});
        $self->{colorJPanel}->setLayout('java::awt::GridLayout'->new(1, 1));
        $self->{colorJPanel}->add($self->{colorJList});
        $self->add($self->{colorJPanel});
}


sub dottedFillRountRectJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{dottedFillRountRectJButton}->getText());
}


sub dottedFillArcJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{dottedFillArcJButton}->getText());
}


sub dottedFillRectJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{dottedFillRectJButton}->getText());
}


sub dottedArcJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{dottedArcJButton}->getText());
}


sub dottedRectButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{dottedRectButton}->getText());
}


sub dottedLineJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{dottedLineJButton}->getText());
}


sub fillRoundRectJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{fillRoundRectJButton}->getText());
}


sub fillRectJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{fillRectJButton}->getText());
}


sub fillArcJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{fillArcJButton}->getText());
}


sub imageJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{imageJButton}->getText());
}


sub roundRectJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{roundRectJButton}->getText());
}


sub charJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{charJButton}->getText());
}


sub stringJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{stringJButton}->getText());
}


sub arcJButtonMousePressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{arcJButton}->getText());
}


sub rectJButtonMouseClicked {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{rectJButton}->getText());
}


sub lineJButtonMouseClicked {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->setSelectedTool($self->{lineJButton}->getText());
}

use org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem;
use org::allbinary::graphics::j2me::workarea::tools::ToolFactory;

1;


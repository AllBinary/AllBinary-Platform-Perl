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
use parent -norequire,'java::lang::Object';


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
    _init_fields($self);
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
            package java::awt::event::MouseAdapter::AnonymousN66526 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mouseClicked {
                my ($self, $evt) = @_;
                $self->lineJButtonMouseClicked($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN66526'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN66526'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN66526')
        });
        $self->add($self->{lineJButton});
        $self->{rectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{rectJButton}->setText("Rect");
        $self->{rectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN66744 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mouseClicked {
                my ($self, $evt) = @_;
                $self->rectJButtonMouseClicked($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN66744'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN66744'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN66744')
        });
        $self->add($self->{rectJButton});
        $self->{arcJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{arcJButton}->setText("Arc");
        $self->{arcJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN66962 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->arcJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN66962'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN66962'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN66962')
        });
        $self->add($self->{arcJButton});
        $self->{stringJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{stringJButton}->setText("String");
        $self->{stringJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN67180 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->stringJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN67180'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN67180'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN67180')
        });
        $self->add($self->{stringJButton});
        $self->{charJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{charJButton}->setText("Char");
        $self->{charJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN67398 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->charJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN67398'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN67398'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN67398')
        });
        $self->add($self->{charJButton});
        $self->{roundRectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{roundRectJButton}->setText("Round Rect");
        $self->{roundRectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN67616 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->roundRectJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN67616'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN67616'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN67616')
        });
        $self->add($self->{roundRectJButton});
        $self->{imageJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{imageJButton}->setText("Image");
        $self->{imageJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN67834 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->imageJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN67834'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN67834'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN67834')
        });
        $self->add($self->{imageJButton});
        $self->{fillArcJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{fillArcJButton}->setText("Fill Arc");
        $self->{fillArcJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN68052 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->fillArcJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN68052'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN68052'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN68052')
        });
        $self->add($self->{fillArcJButton});
        $self->{fillRectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{fillRectJButton}->setText("Fill Rect");
        $self->{fillRectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN68270 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->fillRectJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN68270'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN68270'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN68270')
        });
        $self->add($self->{fillRectJButton});
        $self->{fillRoundRectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{fillRoundRectJButton}->setText("Fill Rnd Rect");
        $self->{fillRoundRectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN68488 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->fillRoundRectJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN68488'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN68488'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN68488')
        });
        $self->add($self->{fillRoundRectJButton});
        $self->{dottedLineJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedLineJButton}->setText("Dot Line");
        $self->{dottedLineJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN68706 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedLineJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN68706'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN68706'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN68706')
        });
        $self->add($self->{dottedLineJButton});
        $self->{dottedRectButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedRectButton}->setText("Dot Rect");
        $self->{dottedRectButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN68924 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedRectButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN68924'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN68924'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN68924')
        });
        $self->add($self->{dottedRectButton});
        $self->{dottedArcJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedArcJButton}->setText("Dot Arc");
        $self->{dottedArcJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN69142 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedArcJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN69142'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN69142'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN69142')
        });
        $self->add($self->{dottedArcJButton});
        $self->{dottedFillRectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedFillRectJButton}->setText("Dot Fill Rect");
        $self->{dottedFillRectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN69360 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedFillRectJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN69360'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN69360'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN69360')
        });
        $self->add($self->{dottedFillRectJButton});
        $self->{dottedFillArcJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedFillArcJButton}->setText("Dot Fill Arc");
        $self->{dottedFillArcJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN69578 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedFillArcJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN69578'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN69578'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN69578')
        });
        $self->add($self->{dottedFillArcJButton});
        $self->{dottedFillRountRectJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{dottedFillRountRectJButton}->setText("Dot Fill Rnd Rect");
        $self->{dottedFillRountRectJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN69796 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->dottedFillRountRectJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN69796'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN69796'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN69796')
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

use java::lang::Object ();
# use java::awt::Font ();
# use java::awt::GridLayout ();
# use java::awt::event::MouseAdapter ();
# use java::awt::event::MouseEvent ();
# use javax::swing::JButton ();
# use javax::swing::JList ();
# use javax::swing::JPanel ();
use org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem ();
use org::allbinary::graphics::j2me::workarea::tools::ToolFactory ();

1;


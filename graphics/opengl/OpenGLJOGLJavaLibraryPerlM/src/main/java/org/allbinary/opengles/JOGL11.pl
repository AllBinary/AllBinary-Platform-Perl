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

#JOGLEToKhronosGL11
package org::allbinary::opengles::JOGL11;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::opengles::JOGL10','javax::microedition::khronos::opengles::GL11';


sub _init_fields {
    my ($self) = @_;
    $self->{gl11} = undef unless exists $self->{gl11};
}

sub new {
    my ($class, @arguments) = @_;
    return _new1($class, @arguments) if scalar(@arguments) == 1;
    return _new2($class, @arguments) if scalar(@arguments) == 2;
    die "No constructor of JOGL11 takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $gl) = @_;
    my $self = _new2($class, $gl, $gl);
        # this(...) made $self above
    return $self;
}


sub _new2 {
    my ($class, $gl, $gl2) = @_;
    my $self = $class->SUPER::new($gl, $gl2);
    _init_fields($self);
        # super(...) made $self above
        $self->{gl11} = $self->getJOGLGL();
    return $self;
}


sub glBindBuffer {
    my ($self, $target, $buffer) = @_;
        $self->{gl11}->glBindBuffer($target, $buffer);
}


sub glBufferData {
    my ($self, $target, $size, $data, $usage) = @_;
        $self->{gl11}->glBufferData($target, $size, $data, $usage);
}


sub glBufferSubData {
    my ($self, $target, $offset, $size, $data) = @_;
        $self->{gl11}->glBufferSubData($target, $offset, $size, $data);
}


sub glClipPlanef_j3 {
    my ($self, $plane, $equation, $offset) = @_;
        $self->{gl11}->glClipPlanef($plane, $equation, $offset);
}


sub glClipPlanef_j2 {
    my ($self, $plane, $equation) = @_;
        $self->{gl11}->glClipPlanef($plane, $equation);
}

sub glClipPlanef {
    my ($invocant, @arguments) = @_;
    return $invocant->glClipPlanef_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glClipPlanef_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glClipPlanef takes " . scalar(@arguments) . " arguments";
}


sub glColor4ub {
    my ($self, $red, $green, $blue, $alpha) = @_;
        $self->{gl11}->glColor4ub($red, $green, $blue, $alpha);
}


sub glColorPointer {
    my ($self, $size, $type, $stride, $offset) = @_;
        $self->{gl11}->glColorPointer($size, $type, $stride, $offset);
}


sub glDeleteBuffers_j3 {
    my ($self, $n, $buffers, $offset) = @_;
        $self->{gl11}->glDeleteBuffers($n, $buffers, $offset);
}


sub glDeleteBuffers_j2 {
    my ($self, $n, $buffers) = @_;
        $self->{gl11}->glDeleteBuffers($n, $buffers);
}

sub glDeleteBuffers {
    my ($invocant, @arguments) = @_;
    return $invocant->glDeleteBuffers_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glDeleteBuffers_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glDeleteBuffers takes " . scalar(@arguments) . " arguments";
}


sub glDrawElements {
    my ($self, $mode, $count, $type, $offset) = @_;
        $self->{gl11}->glDrawElements($mode, $count, $type, $offset);
}


sub glGenBuffers_j3 {
    my ($self, $n, $buffers, $offset) = @_;
        $self->{gl11}->glGenBuffers($n, $buffers, $offset);
}


sub glGenBuffers_j2 {
    my ($self, $n, $buffers) = @_;
        $self->{gl11}->glGenBuffers($n, $buffers);
}

sub glGenBuffers {
    my ($invocant, @arguments) = @_;
    return $invocant->glGenBuffers_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glGenBuffers_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glGenBuffers takes " . scalar(@arguments) . " arguments";
}


sub glGetBufferParameteriv_j4 {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetBufferParameteriv($target, $pname, $params, $offset);
}


sub glGetBufferParameteriv_j3 {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glGetBufferParameteriv($target, $pname, $params);
}

sub glGetBufferParameteriv {
    my ($invocant, @arguments) = @_;
    return $invocant->glGetBufferParameteriv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glGetBufferParameteriv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glGetBufferParameteriv takes " . scalar(@arguments) . " arguments";
}


sub glGetClipPlanef_j3 {
    my ($self, $pname, $eqn, $offset) = @_;
        $self->{gl11}->glGetClipPlanef($pname, $eqn, $offset);
}


sub glGetClipPlanef_j2 {
    my ($self, $pname, $eqn) = @_;
        $self->{gl11}->glGetClipPlanef($pname, $eqn);
}

sub glGetClipPlanef {
    my ($invocant, @arguments) = @_;
    return $invocant->glGetClipPlanef_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glGetClipPlanef_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glGetClipPlanef takes " . scalar(@arguments) . " arguments";
}


sub glGetFloatv_j3 {
    my ($self, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetFloatv($pname, $params, $offset);
}


sub glGetFloatv_j2 {
    my ($self, $pname, $params) = @_;
        $self->{gl11}->glGetFloatv($pname, $params);
}

sub glGetFloatv {
    my ($invocant, @arguments) = @_;
    return $invocant->glGetFloatv_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glGetFloatv_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glGetFloatv takes " . scalar(@arguments) . " arguments";
}


sub glGetLightfv_j4 {
    my ($self, $light, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetLightfv($light, $pname, $params, $offset);
}


sub glGetLightfv_j3 {
    my ($self, $light, $pname, $params) = @_;
        $self->{gl11}->glGetLightfv($light, $pname, $params);
}

sub glGetLightfv {
    my ($invocant, @arguments) = @_;
    return $invocant->glGetLightfv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glGetLightfv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glGetLightfv takes " . scalar(@arguments) . " arguments";
}


sub glGetMaterialfv_j4 {
    my ($self, $face, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetMaterialfv($face, $pname, $params, $offset);
}


sub glGetMaterialfv_j3 {
    my ($self, $face, $pname, $params) = @_;
        $self->{gl11}->glGetMaterialfv($face, $pname, $params);
}

sub glGetMaterialfv {
    my ($invocant, @arguments) = @_;
    return $invocant->glGetMaterialfv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glGetMaterialfv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glGetMaterialfv takes " . scalar(@arguments) . " arguments";
}


sub glGetTexEnviv_j4 {
    my ($self, $env, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetTexEnviv($env, $pname, $params, $offset);
}


sub glGetTexEnviv_j3 {
    my ($self, $env, $pname, $params) = @_;
        $self->{gl11}->glGetTexEnviv($env, $pname, $params);
}

sub glGetTexEnviv {
    my ($invocant, @arguments) = @_;
    return $invocant->glGetTexEnviv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glGetTexEnviv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glGetTexEnviv takes " . scalar(@arguments) . " arguments";
}


sub glGetTexParameterfv_j4 {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetTexParameterfv($target, $pname, $params, $offset);
}


sub glGetTexParameterfv_j3 {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glGetTexParameterfv($target, $pname, $params);
}

sub glGetTexParameterfv {
    my ($invocant, @arguments) = @_;
    return $invocant->glGetTexParameterfv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glGetTexParameterfv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glGetTexParameterfv takes " . scalar(@arguments) . " arguments";
}


sub glGetTexParameteriv_j4 {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetTexParameteriv($target, $pname, $params, $offset);
}


sub glGetTexParameteriv_j3 {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glGetTexParameteriv($target, $pname, $params);
}

sub glGetTexParameteriv {
    my ($invocant, @arguments) = @_;
    return $invocant->glGetTexParameteriv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glGetTexParameteriv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glGetTexParameteriv takes " . scalar(@arguments) . " arguments";
}


sub glIsBuffer {
    my ($self, $buffer) = @_;
        return $self->{gl11}->glIsBuffer($buffer);
}


sub glIsEnabled {
    my ($self, $cap) = @_;
        return $self->{gl11}->glIsEnabled($cap);
}


sub glIsTexture {
    my ($self, $texture) = @_;
        return $self->{gl11}->glIsTexture($texture);
}


sub glNormalPointer {
    my ($self, $type, $stride, $offset) = @_;
        $self->{gl11}->glNormalPointer($type, $stride, $offset);
}


sub glPointParameterf {
    my ($self, $pname, $param) = @_;
        $self->{gl11}->glPointParameterf($pname, $param);
}


sub glPointParameterfv_j3 {
    my ($self, $pname, $params, $offset) = @_;
        $self->{gl11}->glPointParameterfv($pname, $params, $offset);
}


sub glPointParameterfv_j2 {
    my ($self, $pname, $params) = @_;
        $self->{gl11}->glPointParameterfv($pname, $params);
}

sub glPointParameterfv {
    my ($invocant, @arguments) = @_;
    return $invocant->glPointParameterfv_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glPointParameterfv_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glPointParameterfv takes " . scalar(@arguments) . " arguments";
}


sub glTexCoordPointer {
    my ($self, $size, $type, $stride, $offset) = @_;
        $self->{gl11}->glTexCoordPointer($size, $type, $stride, $offset);
}


sub glTexEnvi {
    my ($self, $target, $pname, $param) = @_;
        $self->{gl11}->glTexEnvi($target, $pname, $param);
}


sub glTexEnviv_j4 {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glTexEnviv($target, $pname, $params, $offset);
}


sub glTexEnviv_j3 {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glTexEnviv($target, $pname, $params);
}

sub glTexEnviv {
    my ($invocant, @arguments) = @_;
    return $invocant->glTexEnviv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glTexEnviv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glTexEnviv takes " . scalar(@arguments) . " arguments";
}


sub glTexParameterfv_j4 {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glTexParameterfv($target, $pname, $params, $offset);
}


sub glTexParameterfv_j3 {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glTexParameterfv($target, $pname, $params);
}

sub glTexParameterfv {
    my ($invocant, @arguments) = @_;
    return $invocant->glTexParameterfv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glTexParameterfv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glTexParameterfv takes " . scalar(@arguments) . " arguments";
}


sub glTexParameteri {
    my ($self, $target, $pname, $param) = @_;
        $self->{gl11}->glTexParameteri($target, $pname, $param);
}


sub glTexParameteriv_j4 {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glTexParameteriv($target, $pname, $params, $offset);
}


sub glTexParameteriv_j3 {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glTexParameteriv($target, $pname, $params);
}

sub glTexParameteriv {
    my ($invocant, @arguments) = @_;
    return $invocant->glTexParameteriv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glTexParameteriv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glTexParameteriv takes " . scalar(@arguments) . " arguments";
}


sub glTexParameterxv {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glTexParameteriv($target, $pname, $params, $offset);
}


sub glVertexPointer {
    my ($self, $size, $type, $stride, $offset) = @_;
        $self->{gl11}->glVertexPointer($size, $type, $stride, $offset);
}

use java::lang::Object ();
use com::jogamp::opengl::GL ();
use com::jogamp::opengl::GL2 ();
# use java::nio::Buffer ();
# use java::nio::FloatBuffer ();
# use java::nio::IntBuffer ();
use javax::microedition::khronos::opengles::GL11 ();
use org::allbinary::opengles::JOGL10 ();

1;


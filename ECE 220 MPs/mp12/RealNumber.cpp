#include "RealNumber.h"
#include "helper.h"

//netid: danahar2, sg49, sri4

RealNumber::RealNumber()
{
    /* Your code here */
    number_type = REAL;
    magnitude = 0.0;
    phase = 0.0;
    real_component = 0.0;
}

RealNumber::RealNumber(double rval)
{
    /* Your code here */
    number_type = REAL;
    magnitude = abs(rval);
    phase = calculate_phase(rval, 0);
    real_component = rval;
}

RealNumber::RealNumber( const RealNumber& other )
{
    /* Your code here */
    number_type = other.get_number_type();
    magnitude = other.get_magnitude(); 
    real_component = other.get_real_component();
    phase = other.get_phase();
}

void RealNumber::set_real_component (double rval)
{
    /* Your code here */
    real_component = rval; 
    magnitude = abs(rval);
    phase = calculate_phase(rval, 0);
}

double RealNumber::get_real_component() const
{
    return real_component;
}

double RealNumber::get_magnitude() const{
    return magnitude;
}

double RealNumber::get_phase() const{
    return phase;
}

RealNumber RealNumber::operator + (const RealNumber& arg)
{
    return RealNumber(real_component + arg.get_real_component());
}

RealNumber RealNumber::operator - (const RealNumber& arg)
{
    return RealNumber(real_component - arg.get_real_component());
}

RealNumber RealNumber::operator * (const RealNumber& arg)
{
    return RealNumber(real_component * arg.get_real_component());
}

RealNumber RealNumber::operator / (const RealNumber& arg)
{
    return RealNumber(real_component / arg.get_real_component());
}

ComplexNumber RealNumber::operator + (const ImaginaryNumber& arg){
	return ComplexNumber(real_component, arg.get_imaginary_component());
}

ComplexNumber RealNumber::operator - (const ImaginaryNumber& arg){
	return ComplexNumber(real_component, -1 * arg.get_imaginary_component());
}

ImaginaryNumber RealNumber::operator * (const ImaginaryNumber& arg){
	return ImaginaryNumber(arg.get_imaginary_component() * real_component);
}

ImaginaryNumber RealNumber::operator / (const ImaginaryNumber& arg){
    ComplexNumber c1(real_component, 0);
    ComplexNumber c2(0, arg.get_imaginary_component());
    ComplexNumber res = c1/c2;

    return ImaginaryNumber(res.get_imaginary_component());
}

ComplexNumber RealNumber::operator + (const ComplexNumber& arg){
	return ComplexNumber(real_component + arg.get_real_component(), arg.get_imaginary_component());
}

ComplexNumber RealNumber::operator - (const ComplexNumber& arg){
	return ComplexNumber(real_component - arg.get_real_component(), -1 * arg.get_imaginary_component());
}

ComplexNumber RealNumber::operator * (const ComplexNumber& arg){
	return ComplexNumber(real_component * arg.get_real_component(), real_component * arg.get_imaginary_component());
}

ComplexNumber RealNumber::operator / (const ComplexNumber& arg){
    ComplexNumber c1(real_component, 0);
    ComplexNumber c2(arg.get_real_component(), arg.get_imaginary_component());
    ComplexNumber res = c1/c2;

    return ComplexNumber(res);
}

string RealNumber::to_String(){
    /* Do not modify */
    stringstream my_output;
    my_output << std::setprecision(3) << real_component;
    return my_output.str();
}
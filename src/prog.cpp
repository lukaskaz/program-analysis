#include <cstdint>
#include <iostream>

constexpr uint8_t constTest = 8;
static constexpr uint8_t staticConstTest = 7;
const uint16_t constVarTest = 6;
extern const uint16_t extConstVarTest = 5;
static const uint32_t staticVarTest = 4;
int32_t varTest = 3;

inline constexpr void testDelay()
{
    const uint32_t locConstDelay = 0x05FFFFFF;
    for (uint32_t i{}; i < locConstDelay; i++)
        ;
}

static constexpr char testfunc2()
{
    constexpr int8_t locConstTest = 15;
    auto val = locConstTest;
    testDelay();
    return val;
}

bool testfunc1()
{
    static int16_t locStaticTest;
    static const uint64_t locStaticConstReps = 8;

    locStaticTest++;
    testDelay();
    for (uint32_t i{locStaticConstReps}; i; i--)
    {
        testfunc2();
    }

    return true;
}

int main()
{
    int64_t locTest = 0;

    std::cout << "Test: " << (uint32_t)constTest << std::endl;

    testfunc1();
    testfunc2();

    return 0;
}


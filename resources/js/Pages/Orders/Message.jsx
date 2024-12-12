import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, useForm } from '@inertiajs/react';
import { Card, CardBody } from '@material-tailwind/react';

export default function CreateOrder({ auth, order, user }) {

    console.log(order, user);

    const { data, setData, post, put, errors, reset } = useForm({
        userId: user.id,
        email: user.email,
        subject: '',
        message: '',
    })

    function sendMessage(event) {
        event.preventDefault();
        post(route('orders.sendMessage'));
        reset()
    }

    function handleInput(e) {
        const input = e.target.name;
        const value = e.target.value;
        setData(input, value);
    }

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <div className='flex justify-between items-center'>
                    <h2 className="text-xl font-semibold leading-tight text-gray-800">
                        Send Message
                    </h2>
                </div>
            }
        >
            <Head title="Orders" />

            <div className="py-12">
                <div className="mx-auto max-w-4xl sm:px-6 lg:px-8">
                    {
                        errors && Object.keys(errors).length > 0 && (
                            <div className='bg-red-700 rounded p-4 text-white mb-4'>
                                <span className='font-bold text-lg'>Error submit the message!</span>
                                {Object.values(errors).map(error => <p className='pl-3'>*{error}</p>)}
                            </div>
                        )
                    }
                    <Card>
                        <CardBody>
                            <form onSubmit={sendMessage}>
                                <div className="grid grid-cols-2 gap-4">
                                    <div className="grid grid-cols-1">
                                        Subject
                                        <input className='input' type="text" name='subject' value={data.subject} onInput={handleInput} />
                                    </div>
                                    <div className="grid grid-cols-1">
                                        Email
                                        <input className='input' type="text" readOnly name='email' value={data.email} onInput={handleInput} />
                                    </div>
                                </div>
                                <div className="grid grid-cols-1 gap-4">
                                    <div className="grid grid-cols-1">
                                        Message
                                        <textarea className='input' rows="10" name='message' value={data.message} onInput={handleInput}></textarea>
                                    </div>
                                </div>
                                <div>
                                    <button
                                        className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded float-right mt-3 ml-3'
                                        type='submit'>
                                        Send
                                    </button>
                                </div>
                            </form>
                        </CardBody>
                    </Card>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}